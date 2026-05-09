; DESCRIPTION: Renders a purple box of size 79x104 starting at (224, 41).
; PLAN: r0=224(x), r1=41(y), r2=79(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 41
LDI r2, 79
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
