; DESCRIPTION: Places a blue 109x90 rectangle at position (228, 113).
; PLAN: r0=228(x), r1=113(y), r2=109(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 113
LDI r2, 109
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
