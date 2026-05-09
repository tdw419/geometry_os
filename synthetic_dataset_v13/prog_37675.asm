; DESCRIPTION: Renders a black box of size 85x16 starting at (284, 165).
; PLAN: r0=284(x), r1=165(y), r2=85(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 165
LDI r2, 85
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
