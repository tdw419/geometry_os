; DESCRIPTION: Creates a cyan rectangular region at (307, 74) spanning 54 by 33 pixels.
; PLAN: r0=307(x), r1=74(y), r2=54(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 74
LDI r2, 54
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
