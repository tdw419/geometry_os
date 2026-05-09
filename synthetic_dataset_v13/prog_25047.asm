; DESCRIPTION: Places a cyan 42x36 rectangle at position (106, 55).
; PLAN: r0=106(x), r1=55(y), r2=42(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 55
LDI r2, 42
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
