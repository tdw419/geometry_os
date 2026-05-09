; DESCRIPTION: Creates a cyan rectangular region at (262, 167) spanning 47 by 65 pixels.
; PLAN: r0=262(x), r1=167(y), r2=47(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 167
LDI r2, 47
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
