; DESCRIPTION: Creates a cyan rectangular region at (65, 51) spanning 80 by 50 pixels.
; PLAN: r0=65(x), r1=51(y), r2=80(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 51
LDI r2, 80
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
