; DESCRIPTION: Creates a cyan rectangular region at (131, 70) spanning 50 by 115 pixels.
; PLAN: r0=131(x), r1=70(y), r2=50(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 70
LDI r2, 50
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
