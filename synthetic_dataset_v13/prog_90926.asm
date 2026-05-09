; DESCRIPTION: Creates a cyan rectangular region at (146, 108) spanning 74 by 39 pixels.
; PLAN: r0=146(x), r1=108(y), r2=74(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 108
LDI r2, 74
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
