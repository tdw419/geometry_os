; DESCRIPTION: Places a yellow 12x80 rectangle at position (224, 70).
; PLAN: r0=224(x), r1=70(y), r2=12(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 70
LDI r2, 12
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
