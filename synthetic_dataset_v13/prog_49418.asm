; DESCRIPTION: Creates a red rectangular region at (295, 74) spanning 39 by 70 pixels.
; PLAN: r0=295(x), r1=74(y), r2=39(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 74
LDI r2, 39
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
