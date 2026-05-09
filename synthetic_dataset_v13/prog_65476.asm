; DESCRIPTION: Creates a cyan rectangular region at (265, 180) spanning 93 by 38 pixels.
; PLAN: r0=265(x), r1=180(y), r2=93(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 180
LDI r2, 93
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
