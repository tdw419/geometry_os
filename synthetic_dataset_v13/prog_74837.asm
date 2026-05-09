; DESCRIPTION: Places a green 98x106 rectangle at position (263, 83).
; PLAN: r0=263(x), r1=83(y), r2=98(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 83
LDI r2, 98
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
