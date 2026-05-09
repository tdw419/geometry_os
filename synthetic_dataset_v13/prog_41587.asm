; DESCRIPTION: Creates a cyan rectangular region at (315, 131) spanning 109 by 54 pixels.
; PLAN: r0=315(x), r1=131(y), r2=109(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 131
LDI r2, 109
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
