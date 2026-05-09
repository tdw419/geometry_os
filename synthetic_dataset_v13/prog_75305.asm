; DESCRIPTION: Creates a cyan rectangular region at (287, 195) spanning 42 by 36 pixels.
; PLAN: r0=287(x), r1=195(y), r2=42(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 195
LDI r2, 42
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
