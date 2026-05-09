; DESCRIPTION: Renders a yellow box of size 104x16 starting at (224, 87).
; PLAN: r0=224(x), r1=87(y), r2=104(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 87
LDI r2, 104
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
