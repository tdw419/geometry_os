; DESCRIPTION: Creates a cyan rectangular region at (262, 89) spanning 35 by 65 pixels.
; PLAN: r0=262(x), r1=89(y), r2=35(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 89
LDI r2, 35
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
