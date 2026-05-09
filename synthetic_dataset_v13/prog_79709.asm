; DESCRIPTION: Places a green 92x109 rectangle at position (146, 57).
; PLAN: r0=146(x), r1=57(y), r2=92(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 57
LDI r2, 92
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
