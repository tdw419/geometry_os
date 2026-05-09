; DESCRIPTION: Creates a cyan rectangular region at (215, 74) spanning 107 by 62 pixels.
; PLAN: r0=215(x), r1=74(y), r2=107(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 74
LDI r2, 107
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
