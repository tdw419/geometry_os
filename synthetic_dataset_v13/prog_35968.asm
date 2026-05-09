; DESCRIPTION: Renders a magenta box of size 40x75 starting at (410, 23).
; PLAN: r0=410(x), r1=23(y), r2=40(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 23
LDI r2, 40
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
