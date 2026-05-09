; DESCRIPTION: Places a magenta 56x30 rectangle at position (386, 209).
; PLAN: r0=386(x), r1=209(y), r2=56(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 209
LDI r2, 56
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
