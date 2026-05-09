; DESCRIPTION: Creates a cyan rectangular region at (32, 74) spanning 23 by 93 pixels.
; PLAN: r0=32(x), r1=74(y), r2=23(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 74
LDI r2, 23
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
