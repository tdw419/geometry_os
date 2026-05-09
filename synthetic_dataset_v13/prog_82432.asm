; DESCRIPTION: Renders a black box of size 120x19 starting at (290, 172).
; PLAN: r0=290(x), r1=172(y), r2=120(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 172
LDI r2, 120
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
