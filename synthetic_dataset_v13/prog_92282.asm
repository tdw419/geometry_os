; DESCRIPTION: Creates a cyan rectangular region at (123, 146) spanning 96 by 71 pixels.
; PLAN: r0=123(x), r1=146(y), r2=96(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 146
LDI r2, 96
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
