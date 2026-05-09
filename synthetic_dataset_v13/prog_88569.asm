; DESCRIPTION: Paints the whole screen magenta.
; PLAN: r0=0xFF00FF(color). Op: FILL r0.
LDI r0, 0xFF00FF
FILL r0
HALT
