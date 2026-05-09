; DESCRIPTION: Clears the screen to purple.
; PLAN: r0=0xAA00FF(color). Op: FILL r0.
LDI r0, 0xAA00FF
FILL r0
HALT
