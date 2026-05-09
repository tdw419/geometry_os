; DESCRIPTION: Creates a cyan rectangular region at (42, 152) spanning 43 by 29 pixels.
; PLAN: r0=42(x), r1=152(y), r2=43(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 152
LDI r2, 43
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
