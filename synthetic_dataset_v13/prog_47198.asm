; DESCRIPTION: Creates a cyan rectangular region at (297, 120) spanning 60 by 79 pixels.
; PLAN: r0=297(x), r1=120(y), r2=60(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 120
LDI r2, 60
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
