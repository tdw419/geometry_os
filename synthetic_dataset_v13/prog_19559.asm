; DESCRIPTION: Creates a magenta rectangular region at (242, 159) spanning 117 by 55 pixels.
; PLAN: r0=242(x), r1=159(y), r2=117(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 159
LDI r2, 117
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
