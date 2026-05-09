; DESCRIPTION: Paints the whole screen yellow.
; PLAN: r0=0xFFFF00(color). Op: FILL r0.
LDI r0, 0xFFFF00
FILL r0
HALT
