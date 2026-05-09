; DESCRIPTION: Creates a cyan rectangular region at (150, 25) spanning 95 by 75 pixels.
; PLAN: r0=150(x), r1=25(y), r2=95(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 25
LDI r2, 95
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
