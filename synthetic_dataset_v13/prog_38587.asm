; DESCRIPTION: Creates a cyan rectangular region at (168, 55) spanning 54 by 79 pixels.
; PLAN: r0=168(x), r1=55(y), r2=54(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 55
LDI r2, 54
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
