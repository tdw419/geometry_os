; DESCRIPTION: Creates a green rectangular region at (295, 177) spanning 50 by 52 pixels.
; PLAN: r0=295(x), r1=177(y), r2=50(width), r3=52(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 177
LDI r2, 50
LDI r3, 52
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
