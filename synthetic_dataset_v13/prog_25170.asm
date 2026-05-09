; DESCRIPTION: Places a magenta 48x27 rectangle at position (111, 30).
; PLAN: r0=111(x), r1=30(y), r2=48(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 30
LDI r2, 48
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
