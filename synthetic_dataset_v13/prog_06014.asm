; DESCRIPTION: Places a blue 113x42 rectangle at position (121, 190).
; PLAN: r0=121(x), r1=190(y), r2=113(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 190
LDI r2, 113
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
