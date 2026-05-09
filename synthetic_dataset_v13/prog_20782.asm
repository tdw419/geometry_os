; DESCRIPTION: Creates a cyan rectangular region at (80, 93) spanning 61 by 96 pixels.
; PLAN: r0=80(x), r1=93(y), r2=61(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 93
LDI r2, 61
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
