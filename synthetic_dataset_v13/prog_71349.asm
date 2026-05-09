; DESCRIPTION: Places a magenta 103x64 rectangle at position (239, 164).
; PLAN: r0=239(x), r1=164(y), r2=103(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 164
LDI r2, 103
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
