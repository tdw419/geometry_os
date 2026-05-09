; DESCRIPTION: Places a yellow 42x25 rectangle at position (186, 135).
; PLAN: r0=186(x), r1=135(y), r2=42(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 135
LDI r2, 42
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
