; DESCRIPTION: Renders a black box of size 61x21 starting at (412, 214).
; PLAN: r0=412(x), r1=214(y), r2=61(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 214
LDI r2, 61
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
