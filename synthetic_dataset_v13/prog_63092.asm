; DESCRIPTION: Places a magenta 111x66 rectangle at position (146, 100).
; PLAN: r0=146(x), r1=100(y), r2=111(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 100
LDI r2, 111
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
