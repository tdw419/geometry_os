; DESCRIPTION: Places a magenta 24x86 rectangle at position (112, 146).
; PLAN: r0=112(x), r1=146(y), r2=24(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 146
LDI r2, 24
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
