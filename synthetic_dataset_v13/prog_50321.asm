; DESCRIPTION: Places a magenta 46x47 rectangle at position (44, 209).
; PLAN: r0=44(x), r1=209(y), r2=46(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 209
LDI r2, 46
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
