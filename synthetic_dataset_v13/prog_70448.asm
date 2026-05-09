; DESCRIPTION: Creates a cyan rectangular region at (95, 73) spanning 63 by 92 pixels.
; PLAN: r0=95(x), r1=73(y), r2=63(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 73
LDI r2, 63
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
