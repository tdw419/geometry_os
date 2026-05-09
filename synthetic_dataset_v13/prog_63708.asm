; DESCRIPTION: Creates a cyan rectangular region at (231, 120) spanning 90 by 45 pixels.
; PLAN: r0=231(x), r1=120(y), r2=90(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 120
LDI r2, 90
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
