; DESCRIPTION: Creates a cyan rectangular region at (387, 45) spanning 101 by 54 pixels.
; PLAN: r0=387(x), r1=45(y), r2=101(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 45
LDI r2, 101
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
