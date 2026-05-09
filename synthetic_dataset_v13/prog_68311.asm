; DESCRIPTION: Places a magenta 42x70 rectangle at position (202, 86).
; PLAN: r0=202(x), r1=86(y), r2=42(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 86
LDI r2, 42
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
