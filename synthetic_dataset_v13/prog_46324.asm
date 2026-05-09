; DESCRIPTION: Places a blue 73x90 rectangle at position (157, 146).
; PLAN: r0=157(x), r1=146(y), r2=73(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 146
LDI r2, 73
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
