; DESCRIPTION: Creates a cyan rectangular region at (443, 6) spanning 36 by 65 pixels.
; PLAN: r0=443(x), r1=6(y), r2=36(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 6
LDI r2, 36
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
