; DESCRIPTION: Places a magenta 44x46 rectangle at position (255, 65).
; PLAN: r0=255(x), r1=65(y), r2=44(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 65
LDI r2, 44
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
