; DESCRIPTION: Places a magenta 65x27 rectangle at position (262, 164).
; PLAN: r0=262(x), r1=164(y), r2=65(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 164
LDI r2, 65
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
