; DESCRIPTION: Renders a magenta box of size 104x98 starting at (277, 146).
; PLAN: r0=277(x), r1=146(y), r2=104(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 146
LDI r2, 104
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
