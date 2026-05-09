; DESCRIPTION: Paints the whole screen white.
; PLAN: r0=0xFFFFFF(color). Op: FILL r0.
LDI r0, 0xFFFFFF
FILL r0
HALT
