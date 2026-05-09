; DESCRIPTION: Renders a black box of size 120x64 starting at (214, 30).
; PLAN: r0=214(x), r1=30(y), r2=120(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 30
LDI r2, 120
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
