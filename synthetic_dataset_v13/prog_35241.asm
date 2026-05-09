; DESCRIPTION: Creates a cyan rectangular region at (82, 98) spanning 120 by 89 pixels.
; PLAN: r0=82(x), r1=98(y), r2=120(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 98
LDI r2, 120
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
