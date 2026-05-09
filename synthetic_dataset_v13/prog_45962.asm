; DESCRIPTION: Places a magenta 91x110 rectangle at position (298, 35).
; PLAN: r0=298(x), r1=35(y), r2=91(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 35
LDI r2, 91
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
