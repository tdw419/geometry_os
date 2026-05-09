; DESCRIPTION: Creates a cyan rectangular region at (64, 186) spanning 51 by 42 pixels.
; PLAN: r0=64(x), r1=186(y), r2=51(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 186
LDI r2, 51
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
