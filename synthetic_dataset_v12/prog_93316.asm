; DESCRIPTION: Creates a cyan rectangular region at (187, 82) spanning 90 by 107 pixels.
; PLAN: r0=187(x), r1=82(y), r2=90(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 82
LDI r2, 90
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
